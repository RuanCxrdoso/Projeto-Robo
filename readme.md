<h1 align="center">
  Robô Seguidor de Muro 🤖
</h1>

<p align="center">
  <img alt="GitHub language count" src="https://img.shields.io/github/languages/count/RuanCxrdoso/Projeto-Robo">

  <img alt="Repository size" src="https://img.shields.io/github/repo-size/RuanCxrdoso/Projeto-Robo">
  
  <a href="https://github.com/RuanCxrdoso/Projeto-Robo/commits/main">
    <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/RuanCxrdoso/Projeto-Robo">
  </a>

   <a href="https://github.com/RuanCxrdoso/Projeto-Robo/stargazers">
    <img alt="Stargazers" src="https://img.shields.io/github/stars/RuanCxrdoso/Projeto-Robo?style=social">
  </a>
</p>

<div align="center">
  <img src="https://github.com/RuanCxrdoso/Projeto-Robo/assets/86266893/9d9be081-142d-4b54-ac60-9bdfbbc6e3bc" alt"Mapa">
</div>

<br>

<p align="center">
 <a href="#-sobre">Sobre</a> | 
 <a href="#-como-funciona">Como funciona</a> | 
 <a href="-preview">Preview</a> |
 <a href="#-tecnologias">Tecnologias</a> | 
 <a href="#-autor">Autor</a>
</p>


## 💻 Sobre

O projeto consiste em desenvolver um **Robô seguidor de muro** utilizando `Verilog`, uma linguagem de descrição de hardware. O robô é capaz de se locomover em um mapa, buscando um muro à sua esquerda para segui-lo. Sensores são utilizados à frente e a esquerda do Robô para detectar a presença do muro e controlar os movimentos do robô para mantê-lo próximo ao muro.

Utilizando o `Quartus Prime Lite Edition` e o `ModelSim`, o projeto é simulado com uso de um testbench, fornecido pelo docente, para garantir seu correto funcionamento. Essa atividade prática foi proposta na matéria de Laboratório Integrado I, do curso de Engenharia de Computação da Universidade Federal da Bahia.

---

## ❓ Como funciona 

O mundo do robô é uma matriz de células, na qual cada componente é livre (células brancas) ou ocupado por um muro (células escuras). O robô, mostrado como um triângulo, é colocado em qualquer célula livre, respeitando uma das direções paralelas ao gradeado da matriz (horizontal ou vertical), com sua frente voltada para qualquer um dos 4 sentidos possíveis (Norte, Sul, Leste ou Oeste). O robô possui 2 sensores binários: head (sensor situado na frente do robô, que retorna 1 quando a célula situada à frente do robô está ocupada por um muro – caso contrário, retorna 0) e left (sensor situado na lateral esquerda do robô, que retorna 1 quando a célula do lado esquerdo do robô é ocupada por um muro - caso contrário, retorna 0).

Em relação à movimentação, o robô é capaz de fazer apenas 2 tipos de movimento: avançar para uma célula livre à sua frente ou rotacionar 90° para a esquerda, mantendo-se na mesma célula em que se encontra. Cada movimento consome 1 pulso de clock.

O algoritmo controla o robô da seguinter forma:
- Bloco initial:
  + Nesse bloco, é definido o estado inicial, de acordo com a FSM (Finite State Machine), o Robô tem três estados, `procurando_muro`, `rotacionado` e `acompanhando_muro`. O estado inicial do robô é `procurando_muro`.

<br>

- Primeiro procedimento/always:
  + No primeiro procedimento é implementado o decodificador de próximo estado, em um bloco de procedimento always em que em sua lista de sensibilidade está o `clock` (ativo em baixo) e o `reset` (ativo em alto). Nele é tratado o evento de reset, em que quando ocorre, analisa-se quais são valores de entrada e atribui o devido valor ao estado.

<br>

- Segundo procedimento/always:
  + No segundo procedimento tem-se a atribuição de saídas e do estado futuro, também em um bloco de procedimento always, constando na lista de sensibilidade o `estado_atual`, o `head` e o `left`. Nesse bloco, avaliamos quais foram as entradas e qual é o estado atual, para definirmos quais serão as saídas e o estado futuro.
---

## Preview 📸

### Finite State Machine (FSM)
  ![image](https://github.com/RuanCxrdoso/Projeto-Robo/assets/86266893/c9fd36c3-83a7-4a35-815e-55a09589197d)

### Simulação

  ![image](https://github.com/RuanCxrdoso/Projeto-Robo/assets/86266893/192a06b9-e001-4377-83ec-4c333781b495)

---

## 🛠 Tecnologias 

As seguintes principais ferramentas foram usadas na construção do projeto:

- **[Quartus Prime Lite Edition](https://www.intel.com/content/www/us/en/software-kit/665990/intel-quartus-prime-lite-edition-design-software-version-18-1-for-windows.html)**
- **[ModelSim-Intel FPGAs Standard Edition](https://www.intel.com/content/www/us/en/software-kit/750368/modelsim-intel-fpgas-standard-edition-software-version-18-1.html)**

---

## ✍ Autor 
<div>
  <img alt="Perfil Github" title="Perfil Github" src="https://github.com/RuanCxrdoso.png" width="100px" />
</div>
<br>

[![Linkedin Badge](https://img.shields.io/badge/-Ruan_Cardoso-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://https://www.linkedin.com/in/ruancardosolinkdin/)](https://www.linkedin.com/in/ruancardosolinkdin/)

[![Gmail Badge](https://img.shields.io/badge/-cardosoruan2001@gmail.com-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:cardosoruan2001@gmail.com)](mailto:cardosoruan2001@gmail.com)

Edilton de Jesus Damasceno
Mikelly Correia
Ruan Cardoso


