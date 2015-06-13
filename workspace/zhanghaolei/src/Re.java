import java.util.ArrayList;
import java.util.Iterator;




public class Re {
	public static void main(String[] args) {
		ArrayList h = new ArrayList();
		h.add("1st");
		h.add("2nd");
		h.add(new Integer(3));
		h.add(new Double(4.0));
		Iterator it =h.iterator();
		while (it.hasNext()) 
		{
			System.out.println((it).next());
        }
	}
}
