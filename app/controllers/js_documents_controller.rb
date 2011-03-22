class JsDocumentsController < ApplicationController
  # GET /js_documents
   # GET /js_documents.xml
   def index
     @documents = JsDocument.all

     respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @documents }
       format.json { render :text => @documents.to_json}
     end
   end

   # GET /js_documents/1
   # GET /js_documents/1.xml
   def show
     @document = JsDocument.find(params[:id])

     respond_to do |format|
       format.html # show.html.erb
       format.xml  { render :xml => @document }
       format.json { render :text => @document.to_json}
     end
   end

   # GET /js_documents/new
   # GET /js_documents/new.xml
   def new
     @document = JsDocument.new

     respond_to do |format|
       format.html # new.html.erb
       format.xml  { render :xml => @document }
       format.json { render :text => @document.to_json}
     end
   end

   # GET /js_documents/1/edit
   def edit
     @document = JsDocument.find(params[:id])
   end

   # POST /documents
   # POST /documents.xml
   def create
     @document = JsDocument.new(params[:document])

     respond_to do |format|
       if @document.save
         format.html { redirect_to(@document, :notice => 'JsDocument was successfully created.') }
         format.xml  { render :xml => @document, :status => :created, :location => @document }
         format.json { render :text => @document.to_json}
       else
         format.html { render :action => "new" }
         format.xml  { render :xml => @document.errors, :status => :unprocessable_entity }
         format.json { render :text => @document.to_json}
       end
     end
   end

   # PUT /js_documents/1
   # PUT /js_documents/1.xml
   def update
     @document = JsDocument.find(params[:id])
     respond_to do |format|
       if @document.update_attributes(params[:js_document])
         format.html { redirect_to(@document, :notice => 'JsDocument was successfully updated.') }
         format.xml  { head :ok }
         format.json { render :text => @document.to_json}
       else
         debugger
         format.html { render :action => "edit" }
         format.xml  { render :xml => @document.errors, :status => :unprocessable_entity }
         format.json { render :text => @document.to_json}
       end
     end
   end

   # DELETE /js_documents/1
   # DELETE /js_documents/1.xml
   def destroy
     @document = JsDocument.find(params[:id])
     @document.destroy

     respond_to do |format|
       format.html { redirect_to(documents_url) }
       format.xml  { head :ok }
       format.json { head :ok }
     end
   end
end
