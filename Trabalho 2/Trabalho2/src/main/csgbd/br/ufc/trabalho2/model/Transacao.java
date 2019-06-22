package main.csgbd.br.ufc.trabalho2.model;

public class Transacao {

	private char numero;
	
	public Transacao(char numero) {
		this.numero = numero;
	}

	public char getNumero() {
		return numero;
	}

	public void setNumero(char numero) {
		this.numero = numero;
	}

	@Override
	public String toString() {
		return "Número: " + this.numero; 
	}
}
