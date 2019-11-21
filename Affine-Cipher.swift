import Foundation

class multiplicative {
	var charMessage = [Character]()
	var key1: Int
	var key2: Int
	var message: String
	
	
	init(key1: Int, key2: Int, message: String)
	{
		self.key1 = key1
		self.key2 = key2
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
			k = (((k - 97) * key1 + key2) % 26) + 65
			let c = Character(UnicodeScalar(k)!)
			charMessage.append(c)
		}
	}
	
	func decrypt() {
	
		let r1 = 26
		let r2 = key1
		let t1 = 0
		let t2 = 1
	
		key1 = kInverse(t11: t1, t22: t2, r11: r1, r22: r2)
		
		if key1 < 0 {
			key1 = key1 + 26
		}
		for ch in message.utf8 {
			var k = Int(ch)
			k = (k - 65 - key2)
			if k < 0 {
				k = k + 26
			}
			k = ((k * key1) % 26) + 97
			let c = Character(UnicodeScalar(k)!)
			charMessage.append(c)
		}
	
	}
	
	
	
}
print("Enter test number:", terminator: " ")
let t = Int(readLine()!)!

for _ in 1...t {
	var key1: Int
	var key2: Int
	var message: String
	print("Enter value of key 1:", terminator: " ")
	key1 = Int(readLine()!)!
	print("Enter value of key 2:", terminator: " ")
	key2 = Int(readLine()!)!
	print("Enter the message:", terminator: " ")
	message = readLine()!
	let obj = multiplicative(key1: key1, key2: key2, message: message)
	
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




