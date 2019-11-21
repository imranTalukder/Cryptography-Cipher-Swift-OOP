import Foundation

class multiplicative {
	var charMessage = [Character]()
	var key: Int
	var message: String
	
	
	init(key: Int, message: String)
	{
		self.key = key
		self.message = message
	}
	
	
	func kInverse(t11: Int, t22: Int, r11: Int, r22: Int) -> Int{
		var r1 = r11
		var r2 = r22
		var t1 = t11
		var t2 = t22
		while r2 > 0 {
			let q = r1 / r2
			let r = r1 - q * r2
			r1 = r2
			r2 = r
			
			let t = t1 - q * t2
			t1 = t2
			t2 = t
		}
		return t1
	}
	
	func encrypt() {
		for ch in message.utf8 {
			var k = Int(ch)
			k = (((k - 97) * key) % 26) + 65
			let c = Character(UnicodeScalar(k)!)
			charMessage.append(c)
		}
	}
	
	func decrypt() {
	
		let r1 = 26
		let r2 = key
		let t1 = 0
		let t2 = 1
	
		key = kInverse(t11: t1, t22: t2, r11: r1, r22: r2)
		
		if key < 0 {
			key = key + 26
		}
		for ch in message.utf8 {
			var k = Int(ch)
			k = (((k - 65) * key) % 26) + 97
			let c = Character(UnicodeScalar(k)!)
			charMessage.append(c)
		}
	
	}
	
	
	
}
print("Enter test number:", terminator: " ")
let t = Int(readLine()!)!

for _ in 1...t {
	var key: Int
	var message: String
	print("Enter value of key:", terminator: " ")
	key = Int(readLine()!)!
	print("Enter the message:", terminator: " ")
	message = readLine()!
	let obj = multiplicative(key: key, message: message)
	
	print("Press E for encrypt or D for decrypt:", terminator: " ")
	let check = readLine()
	if check == "E" {
		obj.encrypt()
		print("The encrypted text is:", terminator: " ")
	    print(String(obj.charMessage))
	}
	else if check == "D" {
		obj.decrypt()
		print("The encrypted text is:", terminator: " ")
		print(String(obj.charMessage))
	}
	else {
		print("Invalid Identifier")
	}
	
	
	print("")
}




