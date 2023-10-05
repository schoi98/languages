use std::io;
use rand::Rng;
use std::cmp::Ordering;

fn main() {
    println!("Guess the number!");

    let secret_number = rand::thread_rng().gen_range(1..=100);
    functions(2, 3);
    loop {

        let mut guess = String::new();

        println!("Please input your guess:");
        /*
        this 
        is 
        a 
        multiline
        comment
        */
        /* This is a plain comment */
        
        io::stdin() 
            .read_line(&mut guess)
            .expect("Failed to read line");
    
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue
        };
        
        println!("You guessed: {guess}");
        match guess.cmp(&secret_number) {
            Ordering::Less => println!("Too Small"),
            Ordering::Greater => println!("Too Big"),
            Ordering::Equal => {
                println!("You win!");
                break; 
            }
        }
    } 
}

fn functions(param1: i32, param2: i32) -> i32 {
    let param = param1 + param2;
    for element, index in (1..4) {
        println!("element: {element}, index: {index}")
    }
    return param;
}

fn datatypes() {
    let mut boolean = true;
    boolean ^= false;
    let hex = 0x34;
    let bin = 0b10;
    let oct = 0o47;
    let byte = b'\x04';
    let tup = (hex, bin, oct, byte);
    let arr = [hex, bin, oct, byte];
    println!(tup.0);
    
}