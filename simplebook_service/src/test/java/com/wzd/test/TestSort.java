package com.wzd.test;

import org.junit.Test;

public class TestSort {
    @Test
    public void test(){
        int a[] = {6,5,7,2,1,9,8,4,2};
        //a = sort(a, 0, a.length - 1);
        hhh();
        for (int i : a) {
            System.out.println(i);
        }

    }
    public  void hhh(){
        while (true){
            System.out.println("hhh");
        }

    }
    public int[] sort(int a[],int start,int end){

        int p = a[start];
        int i = start;
        int j = end;
        while (i<j){
            while (i<j&&(a[j]>p)){
                j--;
            }
            while (i<j&&(a[i]<p)){
                i++;
            }
            if (a[i]==a[j]&&i<j){
                i++;
            }else {
                int temp = a[i];
                a[i]=a[j];
                a[j]=temp;
            }
        }
        if (i-1>start) a=sort(a,start,i-1);
        if (j+1<end) a=sort(a,j+1,end);
        return (a);
    }

    @Test
    public void testShuiXian(){
        for (int i=100;i<1000;i++){
            String a = i+"";
            int one = a.charAt(0)-'0';
            int two = a.charAt(1)-'0';
            int three = a.charAt(2)-'0';
            if ((one*one*one+two*two*two+three*three*three)==i){
                System.out.println(i);
            }
        }
    }
}
