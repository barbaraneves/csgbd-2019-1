package main.csgbd.br.ufc.trabalho2.model;

public class Item {

	private char valor;
	
	public Item(char valor) {
		this.valor = valor;
	}

	public int getValor() {
		return valor;
	}

	public void setValor(char valor) {
		this.valor = valor;
	}

	@Override
	public String toString() {
		return "Valor: " + this.valor;
	}
}
