import Foundation

class additive {
	var charMessage = [Character]()
	var key = [Int]()
	var message: String
	
	init(key: [Int], message: String)
	{
		self.key = key
		self.message = message
	}
	func encrypt() {
		var i = 0
		for ch in message.utf8 {
			var k = Int(ch)
			k = ((k - 97 + key[i]) % 26) + 65
			let c = Character(UnicodeScalar(k)!)
			charMessage.append(c)
			i += 1
		}
	}
	
	func decrypt() {
		var i = 0
		for ch in message.utf8 {
			var k = Int(ch)
			k = (k - 65 - key[i])
			if k < 0 {
				k = k + 26
			}
			k = (k % 26) + 97
			let c = Character(UnicodeScalar(k)!)
			charMessage.append(c)
			i += 1
		}
	
	}
	
	
	
}
print("Enter test number:", terminator: " ")
let t = Int(readLine()!)!

for _ in 1...t {
	var key = [Int]()
	var message: String
	print("Enter values of key:", terminator: " ")
	key = readLine()!.components(separatedBy: " ").map{ Int($0)! }
	print("Enter the message:", terminator: " ")
	message = readLine()!
	let obj = additive(key: key, message: message)
	
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




