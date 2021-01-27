package java_01base;
/**
 * @Author:shida
 * @Description:
 * @Date:Create in
 * @Modified By:
 */


public class java_01_demo01 {
    public static void main(String[] args) {
        husband h=new husband("husbang", "男","18");
        wife w=new wife("xx","女","20");
        h.marry(w);
        w.marry(h);
        System.out.println(h.toString());
        System.out.println(w.toString());
    }
}
class  husband extends human{
    public husband(String name,String sex,String age) {
        this.name=name;
        this.sex=sex;
        this.age=age;
    }

    @Override
    public boolean marry(human human) {
        if(human.getSex().equals("女")&&getSpouse()==null){
            this.spouse=(wife)human;
        return true;
        }
        return false;
    }

    @Override
    public String getSex() {
        return super.getSex();
    }

    @Override
    public void setSex(String sex) {
        super.setSex(sex);
    }

    @Override
    public String getName() {
        return super.getName();
    }

    @Override
    public void setName(String name) {
        super.setName(name);
    }

    @Override
    public human getSpouse() {
        return super.getSpouse();
    }

    @Override
    public void setSpouse(human spouse) {
        super.setSpouse(spouse);
    }

    @Override
    public String toString() {
        return "husband{" +
                "sex='" + sex + '\'' +
                ", name='" + name + '\'' +
                ", spouse=" + spouse.name +
                ", age='" + age + '\'' +
                '}';
    }
}
class wife extends human{
    public wife(String name,String sex,String age) {
        this.name=name;
        this.sex=sex;
        this.age=age;
    }

    public wife() {
    }

    @Override
    public boolean marry(human human) {
        if(human.getSex().equals("男")&&getSpouse()==null){
            this.spouse=(husband)human;
            return true;
        }
        return false;
    }

    @Override
    public String getSex() {
        return super.getSex();
    }

    @Override
    public void setSex(String sex) {
        super.setSex(sex);
    }

    @Override
    public String getName() {
        return super.getName();
    }

    @Override
    public void setName(String name) {
        super.setName(name);
    }

    @Override
    public human getSpouse() {
        return super.getSpouse();
    }

    @Override
    public void setSpouse(human spouse) {
        super.setSpouse(spouse);
    }

    @Override
    public String toString() {
        return "husband{" +
                "sex='" + sex + '\'' +
                ", name='" + name + '\'' +
                ", spouse=" + spouse.name +
                ", age='" + age + '\'' +
                '}';
    }
}
class human {


    public String sex;
    public String name;
    public human spouse;
    public String age;

    public boolean marry(human human){return true;}

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public human getSpouse() {
        return spouse;
    }

    public void setSpouse(human spouse) {
        this.spouse = spouse;
    }

    @Override
    public String toString() {

        return "human{" +
                "sex='" + sex + '\'' +
                ", name='" + name + '\'' +
                ", spouse=" + spouse +
                ", age='" + age + '\'' +
                '}';
    }

}
