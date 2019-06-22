package main.csgbd.br.ufc.trabalho2.view;

import java.io.IOException;

import main.csgbd.br.ufc.trabalho2.controller.Escalonamento;
import main.csgbd.br.ufc.trabalho2.controller.ManipuladorArquivo;

public class Principal {
 
    public static void main(String args[]) throws IOException {
        
    	String path = "/tmp/file.txt";
 
    	//Para escrever um novo escalonamento no arquivo.
        ManipuladorArquivo.escritorArquivo(path);
        
    	//Para ler o arquivo e mostrar no console.
    	ManipuladorArquivo.leitorArquivo(path);
        
    	//Escalonamento default:
    		// S1|T1-5|W1|C1|S2|T2-4|C2
    	
    	//Para analisar se o escalonamento é serializável ou não.
        Escalonamento.analisaEscalonamento(path);
    }
}
