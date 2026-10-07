/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.inventoryapp;





import java.util.Scanner;

/**
 *
 * @author prestamo
 */
public class InventoryApp {

     
        private Scanner sc;
        private Inventory inventory;

    public InventoryApp() {
        sc = new Scanner (System.in);
        inventory = new Inventory();
    }

    public static void main(String[] args) {
        InventoryApp app = new InventoryApp();
        app.init();
    }

    public void init() {
        loadInitialData();

        int option;
        do {
            showMenu();
            System.out.print("Seleccione una opción: ");
            option = sc.nextInt();
            sc.nextLine(); // Limpiar búfer

            switch (option) {
                case 1 -> newProduct();
                case 2 -> inventory.printProducts();
                case 3 -> consultProduct(); // Nueva opción agregada
                case 4 -> addStock(); // Nueva opción para agregar existencias
                case 5 -> updateProductPrice();
                case 6 -> deleteProduct();
                case 7 -> showQueries();
                case 0 -> System.out.println("Saliendo del sistema");
                default -> System.out.println("Opción inválida.");
            }
            System.out.println();
        } while (option != 0);
    }

    private void showMenu() {
        System.out.println(" MENÚ DE GESTIÓN DE INVENTARIO ");
        System.out.println("1. Agregar producto");
        System.out.println("2. Mostrar todos los productos");
        System.out.println("3. Consultar producto por ID"); // <- Requerimiento del taller
        System.out.println("4. Agregar existencia a un producto");
        System.out.println("5. Actualizar precio de producto");
        System.out.println("6. Eliminar producto por ID");
        System.out.println("7. Ver consultas generales ");
        System.out.println("0. Salir");
    }

    private void newProduct() {
        System.out.print("Ingrese ID: ");
        int id = sc.nextInt();
        sc.nextLine();

        System.out.print("Ingrese Nombre: ");
        String name = sc.nextLine();

        System.out.print("Ingrese Categoría: ");
        String category = sc.nextLine();

        System.out.print("Ingrese Precio: ");
        double price = sc.nextDouble();

        System.out.print("Ingrese Existencias: ");
        int existence = sc.nextInt();

        Product p = new Product(id, existence, name, price, category);
        inventory.addProduct(p);
        System.out.println("Producto agregado exitosamente.");
    }

    private void consultProduct() {
        System.out.print("Ingrese el ID del producto a consultar: ");
        int id = sc.nextInt();
        Product p = inventory.searchProduct(id);
        if (p != null) {
            System.out.println("Datos del producto: " + p);
        }
    }

    private void addStock() {
        System.out.print("Ingrese el ID del producto para agregar existencia: ");
        int id = sc.nextInt();
        System.out.print("Ingrese la cantidad a sumar: ");
        int quantity = sc.nextInt();

        inventory.addStock(id, quantity);
    }

    private void updateProductPrice() {
        System.out.print("Ingrese el ID del producto a actualizar: ");
        int id = sc.nextInt();
        System.out.print("Ingrese el nuevo precio: ");
        double price = sc.nextDouble();

        inventory.updatePrice(id, price);
    }

    private void deleteProduct() {
        System.out.print("Ingrese el ID del producto a eliminar: ");
        int id = sc.nextInt();

        inventory.deleteProduct(id);
    }

    private void showQueries() {
        if (inventory.size() > 0) {
            System.out.println("Primer elemento: " + inventory.getFirst().getName());
            System.out.println("Último elemento: " + inventory.getLast().getName());
            System.out.println("Total de productos: " + inventory.size());
        } else {
            System.out.println("El inventario está vacío.");
        }
    }

    private void loadInitialData() {
        inventory.addProduct(new Product(1, 50, "manzana", 2000.0, "Frutas"));
        inventory.addProduct(new Product(2, 70, "banano", 1300.0, "Frutas"));
        inventory.addProduct(new Product(3, 30, "aguacate", 6000.0, "Verduras"));
        inventory.addFirstProduct(new Product(4, 59, "pepino", 2500.0, "Verduras"));
        inventory.addProduct(new Product(5, 200, "lulo", 4000.0, "Frutas"));
    }
}
    

