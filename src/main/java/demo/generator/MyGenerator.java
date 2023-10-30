package demo.generator;

import java.io.Serializable;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;

public class MyGenerator implements IdentifierGenerator{
	private String prefix;
	
	public Serializable generate(SharedSessionContractImplementor session, Object object) throws HibernateException {
		
		return null;
	}

}
