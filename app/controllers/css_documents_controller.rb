class CssDocumentsController < ApplicationController
  # GET /js_documents
   # GET /js_documents.xml
   def index
     @documents = CssDocument.all

     respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @documents }
       format.json { render :text => @documents.to_json}
     end
   end

   # GET /css_documents/1
   # GET /css_documents/1.xml
   def show
     @document = CssDocument.find(params[:id])

     respond_to do |format|
       format.html # show.html.erb
       format.xml  { render :xml => @document }
     end
   end

   # GET /css_documents/new
   # GET /css_documents/new.xml
   def new
     @document = CssDocument.new

     respond_to do |format|
       format.html # new.html.erb
       format.xml  { render :xml => @document }
     end
   end

   # GET /css_documents/1/edit
   def edit
     @document = CssDocument.find(params[:id])
   end

   # POST /documents
   # POST /documents.xml
   def create
     @document = CssDocument.new(params[:document])

     respond_to do |format|
       if @document.save
         format.html { redirect_to(@document, :notice => 'CssDocument was successfully created.') }
         format.xml  { render :xml => @document, :status => :created, :location => @document }
       else
         format.html { render :action => "new" }
         format.xml  { render :xml => @document.errors, :status => :unprocessable_entity }
       end
     end
   end

   # PUT /css_documents/1
   # PUT /css_documents/1.xml
   def update
     @document = CssDocument.find(params[:id])

     respond_to do |format|
       if @document.update_attributes(params[:document])
         format.html { redirect_to(@document, :notice => 'CssDocument was successfully updated.') }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @document.errors, :status => :unprocessable_entity }
       end
     end
   end

   # DELETE /css_documents/1
   # DELETE /css_documents/1.xml
   def destroy
     @document = CssDocument.find(params[:id])
     @document.destroy

     respond_to do |format|
       format.html { redirect_to(documents_url) }
       format.xml  { head :ok }
     end
   end
end
