public class ex_11
{
    public static boolean isNumeric(String s) {
        try {
            Double.parseDouble(s);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
 
    public static void main(String[] args)
    {
        System.out.println(isNumeric("AB"));        // false
        System.out.println(isNumeric("AB12"));      // false
        System.out.println(isNumeric("FF"));        // false
        System.out.println(isNumeric("0xFF"));      // false
        System.out.println(isNumeric("3+'0'"));      // false
        System.out.println(isNumeric("'0'"));       // false
        
        System.out.println(isNumeric("  100"));     // true
        System.out.println(isNumeric("09"));        // true
        System.out.println(isNumeric("100"));       // true
        System.out.println(isNumeric("-100"));      // true
        System.out.println(isNumeric("3.14"));      // true
        System.out.println(isNumeric(String.valueOf(Integer.MAX_VALUE)));   // true
        System.out.println(isNumeric(String.valueOf(Long.MAX_VALUE)));      // true
        System.out.println(isNumeric(String.valueOf(Double.MAX_VALUE)));    // true
    }
}
