package Tuxing;
import acm.program.ConsoleProgram;

public class Add2 extends ConsoleProgram { //DialogProgram 
	   public void run() {
	      println("This program adds two numbers.");
	      int n1 = readInt("Enter n1: ");
	      int n2 = readInt("Enter n2: ");
	      int total = n1 + n2;
	      println("The total is " + total + ".");
	   }
	}