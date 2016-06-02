pub fn raindrops(n: u32) -> String {
    let drops: String = [(3, "Pling"),
                         (5, "Plang"),
                         (7, "Plong")].iter()
                                      .filter_map(|&(x, s)| {
                                          if n % x == 0 { Some(s) }
                                          else { None }
                                      })
                                      .collect();

    if drops.is_empty() { n.to_string() }
    else { drops }
}
