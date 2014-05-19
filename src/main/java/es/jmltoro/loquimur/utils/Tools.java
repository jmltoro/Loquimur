package es.jmltoro.loquimur.utils;


import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;

public class Tools {
	
	protected static final Logger log = Logger.getLogger(Tools.class);

	public static String fileToString(String rutaFichero) throws IOException {
		DataInputStream dis = new DataInputStream(new FileInputStream(
				rutaFichero));

		byte[] datainBytes = new byte[dis.available()];
		dis.readFully(datainBytes);
		dis.close();

		String content = new String(datainBytes, 0, datainBytes.length);

		return content;
	}

	public static void bytesToFile(byte[] bytes, String rutaDirectorio,
			String nombreArchivo) throws IOException {
		String FS = System.getProperty("file.separator");
		log.debug("bytes: " + bytes);
		log.debug("ruta: " + rutaDirectorio);
		log.debug("nombre archivo: " + nombreArchivo);

		File folder = new File(rutaDirectorio);

		if (!(folder.exists())) {
			folder.mkdirs();
		}

		FileOutputStream fos = new FileOutputStream(rutaDirectorio + FS
				+ nombreArchivo);
		fos.write(bytes);
	}

	public static byte[] getBytesFromFile(File file) throws IOException {
		InputStream is = new FileInputStream(file);

		long length = file.length();

		byte[] bytes = new byte[(int) length];

		int offset = 0;
		int numRead = 0;
		while ((offset < bytes.length)
				&& ((numRead = is.read(bytes, offset, bytes.length - offset)) >= 0)) {
			offset += numRead;
		}

		if (offset < bytes.length) {
			throw new IOException("Could not completely read file "
					+ file.getName());
		}

		is.close();
		return bytes;
	}

	public static String md5(String cadena) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] messageDigest = md.digest(cadena.getBytes());
			BigInteger number = new BigInteger(1, messageDigest);
			String hashtext = number.toString(16);
			while (hashtext.length() < 32) {
				hashtext = "0" + hashtext;
			}
			return hashtext;
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}

	public static Timestamp fechaActual() {
		Date utilDate = new Date();
		long lnMilisegundos = utilDate.getTime();
		Timestamp sqlTimestamp = new Timestamp(lnMilisegundos);

		return sqlTimestamp;
	}

	public static String getCadenaAlfanumAleatoria(int longitud) {
		char[] elementos = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
				'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
				'y', 'z' };

		Random rand = new Random();
		int index = 0;

		char[] cadenaArray = new char[longitud];

		for (int i = 0; i < longitud; ++i) {
			index = rand.nextInt(elementos.length);
			cadenaArray[i] = elementos[index];
		}

		String cadena = new String(cadenaArray);

		return cadena;
	}

	public static String getCadenaNumericaAleatoria(int longitud) {
		char[] elementos = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };

		Random rand = new Random();
		int index = 0;

		char[] cadenaArray = new char[longitud];

		for (int i = 0; i < longitud; ++i) {
			index = rand.nextInt(elementos.length);
			cadenaArray[i] = elementos[index];
		}

		String cadena = new String(cadenaArray);

		return cadena;
	}

	public static long diferenciaDias(Date fecha1, Date fecha2) {
		long MILLSECS_PER_DAY = 86400000L;
		return ((fecha1.getTime() - fecha2.getTime()) / 86400000L);
	}

	public static String eliminaCaracteresEspeciales(String input) {
		String original = "áàäéèëíìïóòöúùuñÁÀÄÉÈËÍÌÏÓÒÖÚÙÜÑçÇ";

		String ascii = "aaaeeeiiiooouuunAAAEEEIIIOOOUUUNcC";
		String output = input;
		for (int i = 0; i < original.length(); ++i) {
			output = output.replace(original.charAt(i), ascii.charAt(i));
		}
		return output;
	}

	public static boolean isEmail(String correo) {
		Pattern pat = null;
		Matcher mat = null;
		pat = Pattern
				.compile("^([0-9a-zA-Z]([_.w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-w]*[0-9a-zA-Z].)+([a-zA-Z]{2,9}.)+[a-zA-Z]{2,3})$");
		mat = pat.matcher(correo);

		return (mat.find());
	}
	
	public static String jcrypt(String cadena)
	  {
	    return Jcrypt.crypt("ca", cadena);
	  }
}
