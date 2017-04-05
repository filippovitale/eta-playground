import eta.example.MyExportedClass;

public class Main {
  public static void main(String[] args) {
    MyExportedClass mec = new MyExportedClass();
    System.out.println("fib(10): " + mec.fib(10));
  }
}
