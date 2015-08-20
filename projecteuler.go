package main

import (
  "fmt"
  "math"
  "strconv"
  "strings"
)

// Helpers

func StrReverse(s string) string {
  r := []rune(s)
  for i, j := 0, len(r)-1; i < len(r)/2; i, j = i+1, j-1 {
    r[i], r[j] = r[j], r[i]
  }
  return string(r)
}

func AllFactors(n int) map[int]int {
  factors := map[int]int{}
  for i := 2; n > 1; {
    if n % i == 0 {
      factors[i]++
      n /= i
    } else {
      i++
    }
  }
  return factors
}

// Prime Number generator
func PrimeSieveOfErat(n int) []bool {
  n++

  arr := make([]bool, n)
  arr[0] = true
  arr[1] = true
  
  limit := int(math.Sqrt(float64(n))) + int(1)

  for i := 2; i < limit; i++ {
    if arr[i] == false {
      for j := 2 * i; j < n; j += i {
        arr[j] = true
      }
    }
  }

  return arr
}

func PrimeNum(nth int) int {
  n := float64(nth)
  x := int(n * math.Log(n) * 1.2)
  primes := PrimeSieveOfErat(x)

  for key, val := range primes {
    if val == false {
      nth--
      if nth == 0 {
        return key
      }
    }
  }
  return -1
}

// Problems

func P1() int {
  sum := 0
  for i := 1; i < 1000; i++ {
    if i % 15 == 0 {
      sum += i
    } else if i % 5 == 0 {
      sum += i
    } else if i % 3 == 0 {
      sum += i
    }
  }
  return sum
}

func P2() int {
  sum := 0
  a := 1
  b := 2
  for b <= 4000000 {
    if b % 2 == 0 {
      sum += b
    }
    b = a + b
    a = b - a
  }
  return sum
}

func P3() uint64 {
  var num uint64 = 600851475143
  var a uint64 = 2
  for math.Sqrt(float64(num)) >= float64(a) {
    if num % a == 0 {
      num /= a
      a = 2
    } else {
      a++
    }
  }
  return num
}

func P4() int {
  max := 0
  for i := 999; i >= 900; i-- {
    for j := 999; j >= 900; j-- {
      prod := i*j
      if t := strconv.Itoa(prod); t == StrReverse(t) {
        if prod > max {
          max = prod
        }
      }
    }
  }
  return max
}

func P5() int {
  allfactors := map[int]int{}
  for i := 20; i > 1; i-- {
    factors := AllFactors(i)
    for key, val := range factors {
      if val > allfactors[key] {
        allfactors[key] = val
      }
    }
  }
  sum := 1
  for key, val := range allfactors {
    for ; val > 0; val-- {
      sum *= key
    }
  }
  return sum
}

func P6() int {
  // sum of 1 .. 100 is n(n+1)/2
  squaresum := 50*101 * 50 * 101
  sumsquares := 0
  for i := 1; i <= 100; i++ {
    sumsquares += i*i
  }
  return squaresum - sumsquares
}

func P7() int {
  return PrimeNum(10001)
}

func P8() int {
  str := "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450"

  strarr := strings.Split(str, "")
  numarr := make([]int, 1000)

  for i, val := range strarr {
    parsed, err := strconv.Atoi(val)
    if err == nil {
      numarr[i] = parsed
    }
  }

  end := len(numarr) - 13

  max := 0

  for i := 0; i < end; i++ {
    arr := numarr[i:i+13]

    cur := 1
    for k, val := range arr {
      if val == 0 { // If k-th element is 0, move i to i+k+1
        i += k
        break
      }
      cur *= val
    }

    if cur > max {
      max = cur
    }
  }

  return max
}

func P9() int {
  for c := 1000; c >= 0; c-- {
    for b := 1; c - b > 0; b++ {
      a := 1000 - c - b
      if a < 0 {
        continue
      }
      if a*a + b*b == c*c {
        return a*b*c
      }
    }
  }
  return -1
}

func P10() int {
  primes := PrimeSieveOfErat(2000000)
  sum := 0
  for k, v := range primes {
    if v == false {
      sum += k
    }
  }
  return sum
}

func P11() int {
  arr := [20][20]int{
    {8, 2, 22, 97, 38, 15, 0, 40, 0, 75, 4, 5, 7, 78, 52, 12, 50, 77, 91, 8},
    {49, 49, 99, 40, 17, 81, 18, 57, 60, 87, 17, 40, 98, 43, 69, 48, 4, 56, 62, 0},
    {81, 49, 31, 73, 55, 79, 14, 29, 93, 71, 40, 67, 53, 88, 30, 3, 49, 13, 36, 65},
    {52, 70, 95, 23, 4, 60, 11, 42, 69, 24, 68, 56, 1, 32, 56, 71, 37, 2, 36, 91},
    {22, 31, 16, 71, 51, 67, 63, 89, 41, 92, 36, 54, 22, 40, 40, 28, 66, 33, 13, 80},
    {24, 47, 32, 60, 99, 3, 45, 2, 44, 75, 33, 53, 78, 36, 84, 20, 35, 17, 12, 50},
    {32, 98, 81, 28, 64, 23, 67, 10, 26, 38, 40, 67, 59, 54, 70, 66, 18, 38, 64, 70},
    {67, 26, 20, 68, 2, 62, 12, 20, 95, 63, 94, 39, 63, 8, 40, 91, 66, 49, 94, 21},
    {24, 55, 58, 5, 66, 73, 99, 26, 97, 17, 78, 78, 96, 83, 14, 88, 34, 89, 63, 72},
    {21, 36, 23, 9, 75, 0, 76, 44, 20, 45, 35, 14, 0, 61, 33, 97, 34, 31, 33, 95},
    {78, 17, 53, 28, 22, 75, 31, 67, 15, 94, 3, 80, 4, 62, 16, 14, 9, 53, 56, 92},
    {16, 39, 5, 42, 96, 35, 31, 47, 55, 58, 88, 24, 0, 17, 54, 24, 36, 29, 85, 57},
    {86, 56, 0, 48, 35, 71, 89, 7, 5, 44, 44, 37, 44, 60, 21, 58, 51, 54, 17, 58},
    {19, 80, 81, 68, 5, 94, 47, 69, 28, 73, 92, 13, 86, 52, 17, 77, 4, 89, 55, 40},
    {04, 52, 8, 83, 97, 35, 99, 16, 7, 97, 57, 32, 16, 26, 26, 79, 33, 27, 98, 66},
    {88, 36, 68, 87, 57, 62, 20, 72, 3, 46, 33, 67, 46, 55, 12, 32, 63, 93, 53, 69},
    {04, 42, 16, 73, 38, 25, 39, 11, 24, 94, 72, 18, 8, 46, 29, 32, 40, 62, 76, 36},
    {20, 69, 36, 41, 72, 30, 23, 88, 34, 62, 99, 69, 82, 67, 59, 85, 74, 4, 36, 16},
    {20, 73, 35, 29, 78, 31, 90, 1, 74, 31, 49, 71, 48, 86, 81, 16, 23, 57, 5, 54},
    {01, 70, 54, 71, 83, 51, 54, 69, 16, 92, 33, 48, 61, 43, 52, 1, 89, 19, 67, 48} }

  max := 0
  var prod int

  for i := 0; i < 20; i++ {
    for j := 0; j < 20; j++ {
      //horizontal
      if j > 16 { continue }
      prod = arr[i][j] * arr[i][j+1] * arr[i][j+2] * arr[i][j+3]
      if prod > max { max = prod }

      //vertical
      if i > 16 { continue }
      prod = arr[i][j] * arr[i+1][j] * arr[i+2][j] * arr[i+3][j]
      if prod > max { max = prod }

      //left diagonal
      if i > 16 || j < 3 { continue }
      prod = arr[i][j] * arr[i+1][j-1] * arr[i+2][j-2] * arr[i+3][j-3]
      if prod > max { max = prod }

      //right diagonal
      if i > 16 || j > 16 { continue }
      prod = arr[i][j] * arr[i+2][j+1] * arr[i+2][j+2] * arr[i+3][j+3]
      if prod > max { max = prod }
    }
  }
  return max
}

func P12() int {
  factors := 0
  trinum := 0
  for i := 1; factors <= 500; i++ {
    trinum += i
    factors = 0
    for j := 1; j < int(math.Sqrt(float64(trinum))) + 1; j++ {
      if trinum % j == 0 {
        if trinum / j == j {
          factors++
        } else {
          factors += 2
        }
      }
    }
  }
  return trinum
}

func main() {
  fmt.Printf("Problem 1: %d\n", P1())
  fmt.Printf("Problem 2: %d\n", P2())
  fmt.Printf("Problem 3: %d\n", P3())
  fmt.Printf("Problem 4: %d\n", P4())
  fmt.Printf("Problem 5: %d\n", P5())
  fmt.Printf("Problem 6: %d\n", P6())
  fmt.Printf("Problem 7: %d\n", P7())
  fmt.Printf("Problem 8: %d\n", P8())
  fmt.Printf("Problem 9: %d\n", P9())
  fmt.Printf("Problem 10: %d\n", P10())
  fmt.Printf("Problem 11: %d\n", P11())
  fmt.Printf("Problem 12: %d\n", P12())
}
