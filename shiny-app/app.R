
library(bslib)
library(shiny)
library(shinychat)
library(ellmer)
library(mcptools)


ui <- page_fillable(
	title = "R assistant",
	layout_columns(
		card(
			card_header("R assistant"),
			chat_mod_ui(
				id = "chat",
				messages = "**Hello!** I'm your R assistant... How can I help you today ?"
			)
		)
	)
)

server <- function(input, output, session) {
	tools <- mcptools::mcp_tools(config = "mcptools.json")
	chat <- ellmer::chat_ollama(
		base_url = "http://host.docker.internal:11434",
		model = "gemma4:12b-nvfp4",
		system_prompt = "
		    You are an AI assistant that have access to a R session to analyse and answer users request 
				about their single-cell transcriptomic data. You then mostly generate R code that you send to the 
				R session to produce graphic and compute values for the user. 
				
				The R session has notably access to a read-only folder `/app/data` with data shared by the user.
		",
		params = ellmer::params(temperature=1.0,top_k=65,top_p=0.95,num_ctx=1024,think=FALSE)
	)
	chat$register_tools(tools)
	chat_mod_server("chat",chat)
}

shinyApp(ui, server)


