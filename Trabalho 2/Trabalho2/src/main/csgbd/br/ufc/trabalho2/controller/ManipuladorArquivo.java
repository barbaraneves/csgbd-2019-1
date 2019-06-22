package main.csgbd.br.ufc.trabalho2.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;
 
public class ManipuladorArquivo {
 
    public static void leitorArquivo(String path) throws IOException {
        
    	BufferedReader buffRead = new BufferedReader(new FileReader(path));
        
    	String escalonamento = "";        
        System.out.print("\nEscalonamento:");
        
        while (true) {
            if (escalonamento != null) {
                System.out.print(escalonamento + "\n");
 
            } else
                break;
            escalonamento = buffRead.readLine();
        }
        
        buffRead.close();
    }
 
    public static void escritorArquivo(String path) throws IOException {
        
    	BufferedWriter buffWrite = new BufferedWriter(new FileWriter(path));
        String escalonamento = "";
        Scanner in = new Scanner(System.in);
        
        System.out.println("Qual o escalonamento que deseja avaliar?");
        escalonamento = in.nextLine();
        
        buffWrite.append(escalonamento);
        
        buffWrite.close();
    }
 
}