[1mdiff --git a/pom.xml b/pom.xml[m
[1mindex 640f016..002ac79 100644[m
[1m--- a/pom.xml[m
[1m+++ b/pom.xml[m
[36m@@ -4,6 +4,21 @@[m
   <artifactId>functional-test</artifactId>[m
   <version>0.0.1-SNAPSHOT</version>[m
   [m
[32m+[m[41m  [m
[32m+[m	[32m<build>[m
[32m+[m	[32m      <plugins>[m
[32m+[m	[32m          <plugin>[m
[32m+[m	[32m              <groupId>org.apache.maven.plugins</groupId>[m
[32m+[m	[32m              <artifactId>maven-surefire-plugin</artifactId>[m
[32m+[m	[32m              <version>2.20</version>[m
[32m+[m	[32m              <configuration>[m
[32m+[m	[32m                  <parallel>all</parallel>[m
[32m+[m	[32m                  <useUnlimitedThreads>true</useUnlimitedThreads>[m
[32m+[m	[32m              </configuration>[m
[32m+[m	[32m          </plugin>[m
[32m+[m	[32m      </plugins>[m
[32m+[m	[32m</build>[m
[32m+[m[41m  [m
   <dependencies>[m
   	<!-- https://mvnrepository.com/artifact/junit/junit -->[m
 	<dependency>[m
[1mdiff --git a/src/test/java/br/com/matheus/tasks/functional/TasksTest.java b/src/test/java/br/com/matheus/tasks/functional/TasksTest.java[m
[1mindex 235a55a..d60fbda 100644[m
[1m--- a/src/test/java/br/com/matheus/tasks/functional/TasksTest.java[m
[1m+++ b/src/test/java/br/com/matheus/tasks/functional/TasksTest.java[m
[36m@@ -1,5 +1,7 @@[m
 package br.com.matheus.tasks.functional;[m
 [m
[32m+[m[32mimport java.net.MalformedURLException;[m
[32m+[m[32mimport java.net.URL;[m
 import java.util.concurrent.TimeUnit;[m
 [m
 import org.junit.Assert;[m
[36m@@ -7,18 +9,22 @@[m [mimport org.junit.Test;[m
 import org.openqa.selenium.By;[m
 import org.openqa.selenium.WebDriver;[m
 import org.openqa.selenium.chrome.ChromeDriver;[m
[32m+[m[32mimport org.openqa.selenium.remote.DesiredCapabilities;[m
[32m+[m[32mimport org.openqa.selenium.remote.RemoteWebDriver;[m
 [m
 public class TasksTest {[m
 	[m
[31m-	public WebDriver acessarAplicacao(){[m
[31m-		WebDriver driver = new ChromeDriver();[m
[31m-		driver.navigate().to("http://localhost:8001/tasks/");[m
[32m+[m	[32mpublic WebDriver acessarAplicacao() throws MalformedURLException{[m
[32m+[m		[32m//WebDriver driver = new ChromeDriver();[m
[32m+[m		[32mDesiredCapabilities cap = DesiredCapabilities.chrome();[m
[32m+[m		[32mWebDriver driver = new RemoteWebDriver(new URL("http://192.168.0.105:4444/wd/hub"), cap);[m
[32m+[m		[32mdriver.navigate().to("http://192.168.0.105:8001/tasks/");[m
 		driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);[m
 		return driver;[m
 	}[m
 	[m
 	@Test[m
[31m-	public void deveSalvarTarefaComSucesso(){[m
[32m+[m	[32mpublic void deveSalvarTarefaComSucesso() throws MalformedURLException{[m
 		WebDriver driver = acessarAplicacao();[m
 		[m
 		try{[m
[36m@@ -47,7 +53,7 @@[m [mpublic class TasksTest {[m
 	}[m
 	[m
 	@Test[m
[31m-	public void naoDeveSalvarTarefaSemDescricao(){[m
[32m+[m	[32mpublic void naoDeveSalvarTarefaSemDescricao() throws MalformedURLException{[m
 		WebDriver driver = acessarAplicacao();[m
 		[m
 		try{[m
[36m@@ -73,7 +79,7 @@[m [mpublic class TasksTest {[m
 	}[m
 	[m
 	@Test[m
[31m-	public void naoDeveSalvarTarefaSemData(){[m
[32m+[m	[32mpublic void naoDeveSalvarTarefaSemData() throws MalformedURLException{[m
 		WebDriver driver = acessarAplicacao();[m
 		[m
 		try{[m
[36m@@ -99,7 +105,7 @@[m [mpublic class TasksTest {[m
 	}[m
 	[m
 	@Test[m
[31m-	public void naoDeveSalvarComDataPassada(){[m
[32m+[m	[32mpublic void naoDeveSalvarComDataPassada() throws MalformedURLException{[m
 		WebDriver driver = acessarAplicacao();[m
 		[m
 		try{[m
