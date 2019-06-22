package main.csgbd.br.ufc.trabalho2.model;

public class Operacao {

	public Transacao start(char T) {
		Transacao transacao = new Transacao(T);
		return transacao;
	}
	
	public void commit(char T) {
		
	}
	
	public void read(Transacao T, Item X) {
		
	}
	
	public void write(Transacao T, Item X) {
		
	}
}
