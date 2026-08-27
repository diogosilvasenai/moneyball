# BRMW

## Tutorial para executar o projeto

### 1. Instale o XAMPP

Para executar o site e o banco de dados localmente, é necessário ter o **XAMPP** instalado.

O XAMPP fornece o Apache, PHP, MySQL e phpMyAdmin necessários para o funcionamento do projeto.

---

### 2. Abra o XAMPP

Abra o **XAMPP Control Panel**.

Inicie os serviços:

- **Apache**
- **MySQL**

Os dois serviços devem aparecer como **Running**.

---

### 3. Coloque o projeto na pasta `htdocs`

Localize a pasta de instalação do XAMPP. Normalmente ela fica em:

```text
C:\xampp\
```

Entre na pasta:

```text
C:\xampp\htdocs\
```

Coloque o arquivo do projeto (`.zip`) dentro da pasta `htdocs`.

Depois, **extraia o arquivo `.zip` para uma pasta**.

Por exemplo:

```text
C:\xampp\htdocs\brmw\
```

A pasta do projeto deve conter arquivos como:

```text
brmw/
├── api/
├── index.html
├── app.js
├── style.css
├── criar_banco_brmw.sql
└── modelo_brmw.xlsx
```

> O nome da pasta pode ser diferente. Neste tutorial, será utilizado `brmw` como exemplo.

---

### 4. Abra o projeto no VS Code

Abra o **Visual Studio Code** e selecione:

```text
Arquivo → Abrir Pasta
```

Escolha a pasta do projeto que foi extraída dentro de `htdocs`.

Exemplo:

```text
C:\xampp\htdocs\brmw
```

O VS Code será utilizado apenas para visualizar/editar os arquivos do projeto.

---

### 5. Configure o banco de dados pelo phpMyAdmin

Com o **Apache** e o **MySQL** ligados, abra o navegador e acesse:

```text
http://localhost/phpmyadmin
```

No phpMyAdmin:

1. Clique em **Importar**.
2. Clique em **Escolher arquivo**.
3. Selecione o arquivo:

```text
criar_banco_brmw.sql
```

que está dentro da pasta do projeto.

4. Clique em **Importar/Executar**.

O banco de dados será criado automaticamente.

O banco utilizado pelo projeto é:

```text
brmw
```

Depois da importação, verifique no menu lateral do phpMyAdmin se o banco `brmw` aparece.

---

### 6. Verifique a configuração do banco

Abra no VS Code:

```text
api/config.php
```

A configuração padrão deve utilizar:

```text
Banco: brmw
Host: localhost
Usuário: root
Senha: vazia
```

Essa é a configuração padrão do XAMPP.

Se você alterou o usuário ou a senha do MySQL no seu XAMPP, ajuste essas informações no `config.php`.

---

### 7. Abra o site

Depois de iniciar o Apache e o MySQL, abra o navegador.

Acesse:

```text
http://localhost/brmw/
```

Se você deu outro nome à pasta do projeto, substitua `brmw` pelo nome utilizado.

Por exemplo, se a pasta for:

```text
C:\xampp\htdocs\meu-projeto
```

acesse:

```text
http://localhost/meu-projeto/
```

---

### 8. Pronto!

Se tudo estiver configurado corretamente:

- o **Apache** executará o PHP;
- o **MySQL/MariaDB** armazenará os dados;
- o **phpMyAdmin** permitirá administrar o banco;
- o site será acessado pelo endereço `localhost`.

### Resumo

```text
1. Instale o XAMPP
        ↓
2. Abra o XAMPP
        ↓
3. Inicie Apache e MySQL
        ↓
4. Coloque o .zip em C:\xampp\htdocs\
        ↓
5. Extraia o projeto
        ↓
6. Abra a pasta no VS Code
        ↓
7. Acesse http://localhost/phpmyadmin
        ↓
8. Importe criar_banco_brmw.sql
        ↓
9. Acesse http://localhost/NOME-DA-PASTA/
        ↓
10. Site funcionando!
```

> **Importante:** não abra o `index.html` usando `file://` diretamente. Como o projeto utiliza PHP e banco de dados, ele deve ser acessado através do Apache pelo `localhost`.
