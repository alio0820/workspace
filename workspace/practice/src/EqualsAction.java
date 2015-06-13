
public class EqualsAction {

	/**区分equals方法的作用
	 * @param args
	 */
	public static void main(String[] args) {
		/*str1 和str2 指向同一个栈中的对象，因为栈比堆要快，仅次于寄存器，栈数据可以共享
		 * 但缺点是，存在栈中的数据大小与生存期必须是确定的，缺乏灵活性。
		 * 栈中主要存放一些基本类型的变量（,int, short, long, byte, float, double, boolean, char）和对象句柄。
		 */
		String str1 = "abc";
		String str2 = "abc";
		System.out.println(str1==str2); //true 
		/* str3和str4指向不同的堆对象
		 * 堆是由垃圾回收来负责的，堆的优势是可以动态地分配内存大小，生存期也不必事先告诉编译器，
		 * 因为它是在运行时动态分配内存的，Java的垃圾收集器会自动收走这些不再使用的数据。
		 * 但缺点是，由于要在运行时动态分配内存，存取速度较慢。
		 */
		String str3 =new String ("abc");
		String str4 =new String ("abc");
		System.out.println(str3==str4); // false 
	}

}
