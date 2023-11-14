public class Fibo {
    public static void main(String[] args) {
        for (int i = 0; i < 100000; i++) {
            long startTime = System.nanoTime();
            int result = fibonacci(12);
            long totalTime = System.nanoTime() - startTime;
            System.out.println(totalTime+"ns");
        }
    }
    private static int fibonacci(int index) {
        if (index <= 1) {
            return index;
        }
        return fibonacci(index-1) + fibonacci(index-2);
    }
}