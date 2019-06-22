package main.csgbd.br.ufc.trabalho2.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import main.csgbd.br.ufc.trabalho2.model.Item;
import main.csgbd.br.ufc.trabalho2.model.Operacao;
import main.csgbd.br.ufc.trabalho2.model.Transacao;

public class Escalonamento {

	public static void analisaEscalonamento(String path) throws IOException {
		
		BufferedReader buffRead = new BufferedReader(new FileReader(path));
        String escalonamento = "";
        
        char start = 'S';
        char commit = 'C';
        char read = 'R';
        char write = 'W';
        char separador = '-';
              
    	List<Transacao> transacoes = new ArrayList<Transacao>();
    	List<Item> itens = new ArrayList<Item>();
        
        while (true) {
            if (escalonamento != null) { 
            	
            	Operacao op = new Operacao();
            	
                for (int i = 0; i < escalonamento.length(); i++) {
					if(escalonamento.charAt(i) == start) {
						char numero = escalonamento.charAt(i + 1);
						
						Transacao t = op.start(numero);
						
						transacoes.add(t);
						System.out.println(transacoes.toString());
						
					} else if (escalonamento.charAt(i) == separador) {
						if (escalonamento.charAt(i - 2) == read) {
							char valor = escalonamento.charAt(i + 1);
							
							Item d = new Item(valor);
							itens.add(d);
							
						} else if (escalonamento.charAt(i - 2) == write) {
							char valor = escalonamento.charAt(i + 1);
							
							
							//System.out.println(valor);
						}	
						
					}
				}
 
            } else
                break;
            escalonamento = buffRead.readLine();
        }
        
        buffRead.close();
	}
}
