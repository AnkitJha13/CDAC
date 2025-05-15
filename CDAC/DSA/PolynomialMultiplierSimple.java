import java.util.*;

public class PolynomialMultiplierSimple {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        List<Integer> coeffs = new ArrayList<>();
        List<Integer> powers = new ArrayList<>();

        // Read coefficients and powers until 0 flag
        while (true) {
            int coeff = sc.nextInt();
            int power = sc.nextInt();
            int cont = sc.nextInt();

            coeffs.add(coeff);
            powers.add(power);

            if (cont == 0) break;
        }

        int scalar = sc.nextInt();

        // Print original polynomial
        printPolynomial(coeffs, powers);

        // Multiply by scalar and print result
        for (int i = 0; i < coeffs.size(); i++) {
            coeffs.set(i, coeffs.get(i) * scalar);
        }

        printPolynomial(coeffs, powers);
    }

    static void printPolynomial(List<Integer> coeffs, List<Integer> powers) {
        for (int i = 0; i < coeffs.size(); i++) {
            System.out.print(coeffs.get(i) + "x^" + powers.get(i));
            if (i != coeffs.size() - 1) System.out.print("+");
        }
        System.out.println();
    }
}


// 5 3 1  6 2 1  -3 1 1  4 0 0  4