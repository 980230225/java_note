package java_01base;

/**
 * @Author:shida
 * @Description:
 * @Date:Create in
 * @Modified By:
 */

public class java_01_demo02 {
    static int splice_count=0;
    static void intDemo(){
        Integer integer=new Integer(10);
        int i=2147483647;
        System.out.println(integer);
        System.out.println("Integer最大值"+integer.MAX_VALUE);
        System.out.println("Integer最小值"+integer.MIN_VALUE);
        System.out.println("int最大值"+-2147483648);
        System.out.println("int最大值"+2147483647);

    }
    static String splice(Object obj1, Object obj2){
        return obj1.toString()+obj2.toString();

    }
    static void spliceDemo(){
        Integer integer1=1;
        Integer integer2=2;
        String result="";
        for (int i = 1; i<=10; i++){
            splice_count++;

            result =splice(splice(integer1,integer2)+"\t"+splice_count,result);
            System.out.println(result);
            System.out.println("-------------------------");
        }



    }


    public static void main(String[] args) {
        spliceDemo();
    }

}
