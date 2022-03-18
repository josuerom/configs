public class Multiply {
	private int resultado = 0;

	public void multiply(int a, int b) {
		boolean positivo = Math.abs(b) == b;

		for (int i = 0; i < Math.abs(b); i++) {
			if (positivo) {
				resultado = resultado + a;
			} else {
				resultado = resultado - a;
			}
		}
	}

	public void resultado() {
		System.out.println("El resultado es = " + resultado);
	}

	public static void main(String[] args) {
		Multiply object = new Multiply();
		object.multiply(50, -50);
		object.resultado();
	}
}
