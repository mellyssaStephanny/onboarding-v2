# API de cadastro de produtos

# Ambiente

- Ruby 2.6.9
- Rails 4.2.8
- MongoDB 4.0.2

# Como executar o projeto

```bash
# Clonando o repositório
git clone https://github.com/mellyssaStephanny/onboarding-v2.git

# Entre na pasta do projeto
$ cd apiProducts

# Instale as dependências
$ bundle install

# Execute o servidor
$ rails s
```

# Rotas

- POST/products
  - criar produto
- GET/products
  - listar todos produtos
- DEL/products/:id
  - apagar um produto
- PUT/products
  - atualizar um produto

### **Criar produto [POST/products]**


- Request 
  
  - Body:
  
    ```json
    {
      "sku": "SG-WA4-40MM-BL",
      "name": "Galaxy Watch4 BT 40mm - Preto",
      "price": 2189.56,
      "amount": 789,
      "description": "Galaxy Watch4: o companheiro da sua jornada rumo a uma vida mais saudável"
    }
    ```
- Response (Created)

  - Status Code: 201
  
  - Body:
  
    ```json
    {
      "id": "624c7cb187a7452d588f91a5",
      "sku": "SG-WA4-40MM-BL",
      "name": "Galaxy Watch4 BT 40mm - Preto",
      "price": 2189.56,
      "amount": 789,
      "description": " Galaxy Watch4: o companheiro da sua jornada rumo a uma vida mais saudável."
    }
    ```

- Response (Bad Request)
  
  - Status Code: 400


### Listar produtos **[GET/products]**

- Response (OK)

  - Status Code: 200
  
  - Body:

    ```json
    {
      "products": [
        {
          "id": "624c773087a7452d588f91a1",
          "sku": "TV-55-BL-SN",
          "name": "Smart TV Samsung QLED 55 4K",
          "price": 7899.98,
          "amount": 10,
          "description": "Smart TV Tela QLED 55 Samsung 55q60a 4K"
        },
        {
          "id": "624c7cb187a7452d588f91a5",
          "sku": "SG-WA4-40MM-BL",
          "name": "Galaxy Watch4 BT 40mm - Preto",
          "price": 2189.56,
          "amount": 789,
          "description": " Galaxy Watch4: o companheiro da sua jornada rumo a uma vida mais saudável."
        }
      ]
    }
    ```
    
  ### Detalhes do produto (show) **[GET/products/:id]**

- Request
  
  - Parameters:
  
    **id** - ID do produto

- Response (OK)

  - Status Code: 200

  - Body:

    ```json
    {
      "id": "624c7cb187a7452d588f91a5",
      "sku": "SG-WA4-40MM-BL",
      "name": "Galaxy Watch4 BT 40mm - Preto",
      "price": 2189.56,
      "amount": 789,
      "description": " Galaxy Watch4: o companheiro da sua jornada rumo a uma vida mais saudável"
      }
    ```

- Response (Not Found)
 
  - Status Code: 404

    
### Atualizar produto  **[PATCH/products/{:id}]**


- Request
  
  - Parameters:
  
    **id** - ID do produto

  - Body:
  
    Informar as propriedades que serão alteradas
    
    ```json
    {
      "price": 799.70,
      "amount": 777,
      "description": "Fone Bluetooth com design para ouvir cada momento de música e se manter agitado"
    }
    ```

- Response (OK)

  - Status Code: 200
  
   - Body:
    
      ```json
      {
        "id": "624c7c2b87a7452d588f91a4",
        "sku": "SG-BUD-LIVE-BL",
        "name": "Fone de Ouvido Samsung Galaxy Buds Live Bluetooth - Preto",
        "price": 799.7,
        "amount": 777,
        "description": "Fone Bluetooth com design para ouvir cada momento de música e se manter agitado"
      }
      ```

- Response (Not Found)
 
  - Status Code: 404


### Apagar produto **[DELETE/products/:id]**

- Request
  
  - Parameters:
  
    **id** - ID do produto

- Response (OK)

  - Status Code: 200


- Response (Not Found)
 
  - Status Code: 404
