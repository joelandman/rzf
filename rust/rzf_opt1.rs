fn main() {
    let n = 16000000000;
    let pi = 3.1415926535897;
    let zeta_2 = zeta(n,2);
    let pi_squared_over_6 = pi*pi / 6.0;

    println!("   zeta(2) = {}", zeta_2);
    println!("pi^2 / 6.0 = {}", pi_squared_over_6);
    println!("     error = {}", pi_squared_over_6 - zeta_2);
}

fn zeta(n :i64, a :i64) -> f64 {
  let mut s = 0.0;
  let mut p ;
  let mut q ;

  // first opt ... don't use powf(f64) as it will be slow.
  for i in 1..n {
    p = 1.0/i as f64;
    q = 1.0 ;
    for _j in 1..a+1 {
	q = q * p;
    }
    s+=q
  }
  return s;
}
