/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.jmltoro.loquimur.utils;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class ExcelCreator {

    public HSSFWorkbook createWorkbook(String col, String data) throws Exception {

        HSSFWorkbook wb = new HSSFWorkbook();
        HSSFSheet sheet = wb.createSheet("Listado");

        HSSFCellStyle headerCellStyle = wb.createCellStyle();
        HSSFFont boldFont = wb.createFont();
        boldFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        headerCellStyle.setFont(boldFont);

        HSSFRow row = sheet.createRow(0);
        HSSFCell cell = row.createCell((short) 0);

        String[] cabecera = col.split(",");

        for (int i = 0; i < cabecera.length; i++) {

            sheet.setColumnWidth((short) i, (short) 3500);

            cell.setCellStyle(headerCellStyle);
            // ediaz: Comento la transformación a utf8 porque se come las tildes
            // String text = com.icosis.util.Util.fromIsoLatin1ToUtf8Decode(cabecera[i]);

            cell.setCellValue(new HSSFRichTextString(cabecera[i]));
            cell = row.createCell((short) (i + 1));

        }

        String[] datos = data.split(";;;");

        for (int i = 0; i < datos.length; i++) {

            row = sheet.createRow(i + 1);
            cell = row.createCell((short) 0);

            String[] campos = datos[i].split(":::");

            for (int j = 0; j < campos.length; j++) {
                // ediaz: Comento la transformación a utf8 porque se come las tildes
                // String text = com.icosis.util.Util.fromIsoLatin1ToUtf8Decode(campos[j]);

                cell.setCellValue(new HSSFRichTextString(campos[j]));
                cell = row.createCell((short) (j + 1));
            }
        }

        return wb;
    }
}
