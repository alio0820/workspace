
import javax.swing.JOptionPane;
public class chengfa2 
{
	public static void main(String[] args)
	{
		String output="                     乘法表\n";
		output+="------------------------------------------------\n";
		
		for(int i=1;i<=9;i++)
		{
			for(int j=1;j<=i;j++)
			{
				if(i*j<10)
					output+="   "+j+"x"+i+"="+(i*j);
				else
					output+="  "+j+"x"+i+"="+(i*j);
			}
			output+="\n";
		}
			JOptionPane.showMessageDialog(null,output);
	}
}

