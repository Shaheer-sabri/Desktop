public class App {

    public static boolean ispalindrome(int x){
        String a  = Integer.toString(x);
        StringBuffer sb = new StringBuffer(a);
        String c = sb.reverse().toString();
        System.out.println(c);
        if(a.matches(c)){
          return true;
        }
        return false;
    }


    public static void main(String[] args) throws Exception {
        System.out.println(ispalindrome(1));
        
    }
}
