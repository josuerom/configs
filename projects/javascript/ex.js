const multiply = (a, b) => {
	const positive = Math.abs(b) == b;
	let result = 0;

	for(i = 0; i < Math.abs(b); i++) {
		result = positive ? result + a : result - a;
	}
	return result;
}
const a = multiply(50, -50);
console.log('Result = ', a);
