extern crate chrono;
use chrono::*;

pub fn after(date: DateTime<UTC>) -> DateTime<UTC> {
    date + Duration::seconds(i64::pow(10, 9))
}
