public class App {
    public static int romantoint(String s){
        int sum = 0;
        for(int i=0;i<s.length();i++){
            if(s.charAt(i)=='I' && s.charAt(i+1)=='V'){
                sum = sum + 4;
                i++;
            }
            if(s.charAt(i)=='I'){
                sum = sum + 1;
            }

            if(s.charAt(i)=='V'){
                sum = sum + 5;
            }
            if(s.charAt(i)=='X'){
                sum = sum + 10;
            }
            if(s.charAt(i)=='L'){
                sum = sum + 50;
            }
            if(s.charAt(i)=='C'){
                sum = sum + 100;
            }
            if(s.charAt(i)=='D'){
                sum = sum + 500;
            }
            if(s.charAt(i)=='M'){
                sum = sum + 1000;
            }
        }
        return sum;


    } 

    public static void main(String[] args){
        System.out.println(romantoint("IVIII"));
    }
}
