package algolism;

public class Lessons12918 {
        public boolean solution(String s) {
            char[] arr =s.toCharArray();
            boolean answer = false;
            System.out.println(arr.length);
            if(arr.length == 4 || arr.length == 6){
                answer = true;  
            }
            for(int i=0; i<arr.length; i++){
                if(arr[i]<48 || arr[i]>57){
                    answer = false;
                }
            }
            System.out.println(answer);
            return answer;
        }
        
        public static void main(String[] args) {
            Lessons12918 l = new Lessons12918();
            l.solution("a23456");
        }
}
