
public class InventaryApp {

    public static void main(String[] args) {
       Product p1 = new Product();
       p1.setID(01);
       p1.setName("manzana");
       p1.setPrice((double)2000);
       p1.setExistence(50);
       
       
       Product p2 = new Product();
       p2.setID(02);
       p2.setName("banano");
       p2.setPrice((double)1300);
       p2.setExistence(70);
       
       Product p3 = new Product(03,30,"aguacate",(double)6000);
       
       Product p4 = new Product();
       p1.setID(04);
       p1.setName("pepino");
       p1.setPrice((double)2500);
       p1.setExistence(59);
       
       Product p5 = new Product(05,200,"lulo",(double)4000);
       
        System.out.println(p1.getName());
        System.out.println(p1.getExistence());
        
        p1.setPrice((double)4000);
        System.out.println(p1.toString());
       
        //Se imprime el segundo
        
        System.out.println(p2.getName());
        System.out.println(p2.getExistence());
        
        p2.setPrice((double)2400);
        System.out.println(p2.toString());
        
        LinkedList <Product> Products 
       
       
    }
}
