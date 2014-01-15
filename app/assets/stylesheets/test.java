import java.util.Arrays

public class Question{
	public static int (string input){
		char[] charArray = input.toCharArray();
		Arrays.sort(charArray);
		char check = charArray[0];
		for (int i=1; i<charArray.size(); i++){
			if (check == charArray[0]){
				return false;
			}
		}
		return true;
	}
}
