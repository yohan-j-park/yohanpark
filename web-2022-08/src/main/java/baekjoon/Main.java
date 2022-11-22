package baekjoon;

import java.util.Scanner;

public class Main{
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        int t = sc.nextInt();
        
        int max=0;
        
        for(int i=0; i<t; i++) {
            int a = sc.nextInt();
            int b = sc.nextInt();
            
            if(a%i==0 && b%i==0) {
                max=i;
            }
            int min = (a*b)/max;
            
            System.out.println(min);
        }
        
    }
}