package es.jmltoro.loquimur.actions;

import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;

import es.jmltoro.loquimur.entities.vistas.VwEmision;

public class Ejemplo {

	private EntityManager entityManager = EntityManagerUtil.getEntityManager();

	  public static void main(String[] args) {
	    Ejemplo example = new Ejemplo();
//	    System.out.println("After Sucessfully insertion ");
//	    Student student1 = example.saveStudent("Sumith");
//	    Student student2 = example.saveStudent("Anoop");
//	    example.listStudent();
//	    System.out.println("After Sucessfully modification ");
//	    example.updateStudent(student1.getStudentId(), "Sumith Honai");
//	    example.updateStudent(student2.getStudentId(), "Anoop Pavanai");
//	    example.listStudent();
//	    System.out.println("After Sucessfully deletion ");
//	    example.deleteStudent(student2.getStudentId());
	    example.listStudent();
	   

	  }

//	  public VwEmision saveStudent(String studentName) {
//		  VwEmision emision = new VwEmision();
//	    try {
//	      entityManager.getTransaction().begin();
//	      emision.setStudentName(studentName);
//	      emision = entityManager.merge(emision);
//	      entityManager.getTransaction().commit();
//	    } catch (Exception e) {
//	      entityManager.getTransaction().rollback();
//	    }
//	    return emision;
//	  }

	  public void listStudent() {
	    try {
	      entityManager.getTransaction().begin();
	      @SuppressWarnings("unchecked")
	      List<VwEmision> emisiones = entityManager.createQuery("from VwEmision").getResultList();
	      for (Iterator<VwEmision> iterator = emisiones.iterator(); iterator.hasNext();) {
	    	  VwEmision em = (VwEmision) iterator.next();
	        System.out.println(em.getDestino());
	      }
	      entityManager.getTransaction().commit();
	    } catch (Exception e) {
	      entityManager.getTransaction().rollback();
	    }
	  }

//	  public void updateStudent(Long studentId, String studentName) {
//	    try {
//	      entityManager.getTransaction().begin();
//	      Student student = (Student) entityManager.find(Student.class, studentId);
//	      student.setStudentName(studentName);
//	      entityManager.getTransaction().commit();
//	    } catch (Exception e) {
//	      entityManager.getTransaction().rollback();
//	    }
//	  }

//	  public void deleteStudent(Long studentId) {
//	    try {
//	      entityManager.getTransaction().begin();
//	      Student student = (Student) entityManager.find(Student.class, studentId);
//	      entityManager.remove(student);
//	      entityManager.getTransaction().commit();
//	    } catch (Exception e) {
//	      entityManager.getTransaction().rollback();
//	    }
//	  }
	}
