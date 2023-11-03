public class App {
    public static int[] twoSum(int[] nums, int target){
        int[] result = new int[2];
        for(int i = 0; i<nums.length; i++){
            for(int j = i; j<nums.length;j++){
                if(i != j && (nums[i] + nums[j] == target)){
                    result[0] = i;
                    result[1] = j;
                }
            }
        }

    return result;
    }

    public static int[] etwoSum(int[] nums, int target){
        int[] result = new int[2];
        boolean a = false;
        int i = 0;
        while(a == false){
            if(i+1<nums.length && nums[i] + nums[i+1] == target){
                result
            }else{
                i++;
            }


        }
    }

    public static void main(String[] args){
        int[] a = {1,2,3,4,5};
        int b = 8;
        int[] r = new int[2];
        r = twoSum(a, b);

        for(int i = 0; i<2; i++){
            System.out.println(r[i]);
        }
    }
    
}
