#!/usr/bin/env python
# coding: utf-8

# In[1]:


pip install pyodbc


# In[2]:


pip install pandas


# In[3]:


pip install matplotlib


# In[4]:


import pandas as pd
import pyodbc
import matplotlib

dados_conexao = (
    "Driver={SQL Server};"
    "Server=LAPTOP-MC8U137O;"
    "Database=ContosoRetailDW;"
)

conexao = pyodbc.connect(dados_conexao)
print('conexao bem sucedida')


# In[5]:


comando_sql = "SELECT ColorName, UnitPrice FROM DimProduct"

dados = pd.read_sql(comando_sql, conexao)


# In[6]:


display(dados)


# In[9]:


dados.groupby('ColorName').count()


# In[10]:


total_produtos_por_cor = dados.groupby('ColorName').count()


# In[11]:


display(total_produtos_por_cor)


# In[12]:


total_produtos_por_cor.plot(kind='bar')


# In[ ]:




