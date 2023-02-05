44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
import java.util.Scanner;


public class FibonnaciSymDiff_conjecture_testing {
    
    private int k;
    private int l;
    private int num;
    
    // Fibonacci helper
    private int F(int n) {
        if (n == 0)
            return 0;
        if (n < 0)
            return -1 * (int) Math.pow(-1, n) * F(Math.abs(n));
        if (n == 1 || n == 2)
            return 1;
        if (n < 1) {
            System.out.println("invalid Fibonacci number");
            return 0;
        }
        return F(n-1) + F(n-2);
    }
    
    public FibonnaciSymDiff_conjecture_testing(int num, int k, int l) {
        this.k = k;
        this.l = l;
        this.num = num;
    }
    
    public void printSD() {
        System.out.println("Sym Diff Sequence Fn*F(n+" + k + ") - F(n+" + l + ")*F(n+" + (k-l) + "): ");
        for (int i = 1; i <= num + k; i++) {
            System.out.print(F(i) + " ");
        }
        System.out.println();
        int i = 1;
        while (i <= num) {
            System.out.print(F(i)*F(i+k)-F(i+l)*F(i+k-l) + " ");
            i++;
        }
        System.out.println();
        System.out.println();
    }
    
    public void printCase(int a) {
        System.out.println("Sym Diff Sequence F(n)*F(n+k)-F(n+j)*F(n+k-j): ");
        System.out.println("n = " + a + ", k = " + k + ", j = " + l);
        
        System.out.println("F(n) = F(" + a + ") = " + F(a));
        System.out.println("F(n+k) = F(" + a + "+" + k + ") = " + F(a+k));
        System.out.println("F(n+j) = F(" + a + "+" + l + ") = " + F(a+l));
        System.out.println("F(n+k-j) = F(" + a + "+" + k + "-" + l + ") = " + F(a+k-l));
        System.out.println("F(j) = F(" + l + ") = " + F(l));
        System.out.println("F(k-j) = F(" + k + "-" + l + ") = " + F(k-l));
        
        System.out.println("Sym Diff Sequence F(" + a + ")*F("+ a + "+" + k + ")-F(" + a + "+" + l + ")*F(" + a + "+" + (k-l) + "): ");

        System.out.println("Expected: (-1)^(n+1) * F(j)*F(k-j) = (-1)^" + (a+1) + " * " + F(l) + "*" + F(k-l));
        System.out.println("Returned: " + (int) Math.pow(-1, a+1) * F(l)*F(k-l));
        
        /*
        int max = Math.max(Math.max(a, a + k), Math.max(a + l, a + k - l));
        int min = Math.min(Math.min(a, a + k), Math.min(a + l, a + k - l));
        for (int i = min; i <= max; i++) {
            System.out.print(F(i) + " ");
        }
        System.out.println();
        
        int i = a;
        while (i <= max) {
            System.out.print(F(i)*F(i+k)-F(i+l)*F(i+k-l) + " ");
            i++;
        }
        
        for (int i = a; i <= max; i++) {
            System.out.print(F(i)*F(i+k)-F(i+l)*F(i+k-l) + " ");
            i++;
        }
        
        
        System.out.println();
        */
        System.out.println();
    }
    
    public boolean conjecture(int n, int k, int j) {
        return F(n)*F(n+k)-F(n+j)*F(n+k-j) == (int) Math.pow(-1, n+1) * F(j)*F(k-j);
    }
    
    public int[] distribution(int m, int i) {
        int[] aod = new int[m+2];
        if (i == 0) {
            aod[0] = 1;
            aod[1] = 1;
            return aod;
        }
        int g = 1;
        int f = 0;
        int count = 0;
        while (count < i) {
            if (f + 1 < g) {
                aod[f] = 0;
                aod[f+1] = 1;
                f++;
            }
            else {
                aod[f] = 0;
                aod[g] = 0;
                aod[g+1] = 1;
                aod[0] = 1;
                g++;
                f = 0;
            }
            count++;
        }
        return aod;
    }
    
    public int getA(int[] aod) {
        int current = 0;
        while (aod[current] == 0)
            current++;
        return current;
    }
    
    public int getB(int[] aod) {
        int current = 0;
        while (aod[current] == 0)
            current++;
        int fbar = current;
        current = 0;
        while (aod[fbar + current + 1] == 0)
            current++;
        return current;
    }
    
    public int getC(int[] aod) {
        int current = 0;
        while (aod[current] == 0)
            current++;
        int fbar = current;
        current = 0;
        while (aod[fbar + current + 1] == 0)
            current++;
        int sbar = fbar + current + 1;
        current = 0;
        while (sbar + current + 1 < aod.length)
            current++;
        return current;
    }
    
    public static void main(String[] args) {
        
        /*
        Scanner scan = new Scanner(System.in);
        
        while (true) {

            System.out.print("How many terms? ");
            int a = scan.nextInt();

            System.out.print("Distance to max? ");
            int b = scan.nextInt();

            System.out.print("Distance to 2nd term? ");
            int c = scan.nextInt();

            SymDiff s = new SymDiff(a, b, c);
            s.printSD();

        }
        */
        
        int a = 0;
        int b = 0;
        int c = 0;
        int m = 0;
        int count = 0;
        int[] aod;
        FibonnaciSymDiff_conjecture_testing sd = new FibonnaciSymDiff_conjecture_testing(5, b, c);
        System.out.println("Checking (0, 0, 0):");
        while (sd.conjecture(a, b, c)) {
            for (int i = 0; i < ((m + 2) * (m + 1))/2; i++) { // iterates m + 2 choose 2 times
                aod = sd.distribution(m, i);
                a = sd.getA(aod);
                b = -sd.getB(aod);
                c = sd.getC(aod);
                System.out.println("Checking (" + a + ", " + b + ", " + c + "):");
                sd = new FibonnaciSymDiff_conjecture_testing(5, b, c);
                if (sd.conjecture(a, b, c)) {
                    System.out.println("True");
                    sd.printCase(a);
                    count++;
                    System.out.println("Number of cases checked: " + count);
                    System.out.println();
                }
            }
            m++;
        }
        
    }
    
}


/* Notes
Fn*F(n+k)-F(n+1)*F(n+k-1) = (-1)^(n+1) F(k-1)
Fn*F(n+k)-F(n+j)*F(n+k-j) = (-1)^(n+1) F(j)*F(k-j)
*/