import org.jopendocument.dom.OOUtils;
import org.jopendocument.dom.spreadsheet.Sheet;
import org.jopendocument.dom.spreadsheet.SpreadSheet;

import java.io.File;
import java.io.IOException;
import java.util.Date;

/**
 * Created by Neil on 15/01/2015.
 */
public class jOpenDocumentModifyTest {

    public static void main(String[] args) throws IOException {

        // Load the file.
        File file = new File("results.ods");
        final Sheet sheet = SpreadSheet.createFromFile(file).getSheet(0);

        //System.out.println(sheet.getUsedRange().getStartPoint().toString());
        //System.out.println(sheet.getUsedRange().getEndPoint().toString());

        if ( !isCorrectTemplate(sheet) ) {
            return;
        } else {
            System.out.println("File provided is in same format as template!");
            //Fill data
        }

        OOUtils.open(file);

    }

    public static boolean isCorrectTemplate(Sheet s) {
        if (s.getCellAt("A1").getValue().equals("Student") &&
                s.getCellAt("B1").getValue().equals("CS101") &&
                s.getCellAt("C1").getValue().equals("CS102") ) {

            return true;
        } else {
            System.out.println("File provided is not in same format as template!");
            System.out.println("Exiting...");
            return false;
        }
    }

}
