package br.com.matheus.tasks.functional;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.concurrent.TimeUnit;

import org.junit.Assert;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;

public class TasksTest {
	
	public WebDriver acessarAplicacao() throws MalformedURLException{
		//WebDriver driver = new ChromeDriver();
		DesiredCapabilities cap = DesiredCapabilities.chrome();
		WebDriver driver = new RemoteWebDriver(new URL("http://192.168.0.105:4444/wd/hub"), cap);
		driver.navigate().to("http://192.168.0.105:8001/tasks/");
		driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
		return driver;
	}
	
	@Test
	public void deveSalvarTarefaComSucesso() throws MalformedURLException{
		WebDriver driver = acessarAplicacao();
		
		try{
			
			//Clicar em Todo
			driver.findElement(By.id("addTodo")).click();
			
			//Preencher campo task
			driver.findElement(By.id("task")).sendKeys("Task1");
			
			//Preencher campo data
			driver.findElement(By.id("dueDate")).sendKeys("28/07/2020");
			
			//Clicar em salvar
			driver.findElement(By.id("saveButton")).click();
			
			//Validando menssagem
			String message = driver.findElement(By.id("message")).getText();
			Assert.assertEquals("Success!", message);
			
		} finally {
			//Fechando navegador
			driver.quit();
		}
		
	}
	
	@Test
	public void naoDeveSalvarTarefaSemDescricao() throws MalformedURLException{
		WebDriver driver = acessarAplicacao();
		
		try{
			
			//Clicar em Todo
			driver.findElement(By.id("addTodo")).click();
			
			//Preencher campo data
			driver.findElement(By.id("dueDate")).sendKeys("28/07/2020");
			
			//Clicar em salvar
			driver.findElement(By.id("saveButton")).click();
			
			//Validando menssagem
			String message = driver.findElement(By.id("message")).getText();
			Assert.assertEquals("Fill the task description", message);
			
		} finally {
			//Fechando navegador
			driver.quit();
		}
		
	}
	
	@Test
	public void naoDeveSalvarTarefaSemData() throws MalformedURLException{
		WebDriver driver = acessarAplicacao();
		
		try{
			
			//Clicar em Todo
			driver.findElement(By.id("addTodo")).click();
			
			//Preencher campo task
			driver.findElement(By.id("task")).sendKeys("Task1");
			
			//Clicar em salvar
			driver.findElement(By.id("saveButton")).click();
			
			//Validando menssagem
			String message = driver.findElement(By.id("message")).getText();
			Assert.assertEquals("Fill the due date", message);
			
		} finally {
			//Fechando navegador
			driver.quit();
		}
		
	}
	
	@Test
	public void naoDeveSalvarComDataPassada() throws MalformedURLException{
		WebDriver driver = acessarAplicacao();
		
		try{
			
			//Clicar em Todo
			driver.findElement(By.id("addTodo")).click();
			
			//Preencher campo task
			driver.findElement(By.id("task")).sendKeys("Task1");
			
			//Preencher campo data
			driver.findElement(By.id("dueDate")).sendKeys("27/07/2020");
			
			//Clicar em salvar
			driver.findElement(By.id("saveButton")).click();
			
			//Validando menssagem
			String message = driver.findElement(By.id("message")).getText();
			Assert.assertEquals("Due date must not be in past", message);
			
		} finally {
			//Fechando navegador
			driver.quit();
		}
		
	}
}


