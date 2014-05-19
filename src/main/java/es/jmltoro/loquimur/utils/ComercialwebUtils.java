package es.jmltoro.loquimur.utils;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;

public class ComercialwebUtils {

	/**
     * Convierte una cadena pasada de la codificaciÃ³n del Sistema a ISO-8859-1.
     * 
     * @param texto
     *            Cadena a convertir.
     * @return txt Cadena convertida.
     */
    public static String fromDefaultSystemCharsetToIsoLatin1(String texto) {

        try {
            String isoName = "ISO-8859-1";
            String defaultName = Charset.defaultCharset().name();
            Charset isoCharset = Charset.forName(isoName);
            Charset defaultCharset = Charset.forName(defaultName);
            byte[] bArr = texto.getBytes();

            /* Para determinar la codificaciÃ³n de la cadena. */
            InputStream in = new ByteArrayInputStream(bArr);
            InputStreamReader inRead = new InputStreamReader(in);
            String charset = inRead.getEncoding();

            if (charset.equals(isoName)) {
                return texto;
            } else {
                ByteBuffer inputBuffer = ByteBuffer.wrap(bArr);

                // Decode Default charset.
                CharBuffer data = defaultCharset.decode(inputBuffer);
                // Encode ISO-8859-1.
                ByteBuffer outputBuffer = isoCharset.encode(data);
                byte[] outputData = outputBuffer.array();
                String txt = new String(outputData);

                return txt;
            }
        } catch (Exception e) {
            return null;
        }
    }
    
}
