class NotesController < ApplicationController
    # sets the ground work to find every specific note ppl make also CREATES INSTANCE VARIABLE
    before_action :find_note, only: [:show, :edit, :update, :destroy]
    
    # only show notes where they have a user id of current user.
    def index
        @notes = Note.where(user_id: current_user)
    end
    
    def show
    end
    
    def new
        @note = current_user.notes.build
    end
    
    def create
        @note = current_user.notes.build(note_params)
        if @note.save
            redirect_to @note
        else
            render 'new'
        end
            
    end
    
    def edit
    end
    
    def update
        if @note.update(note_params)
            redirect_to @note
        else
            render 'edit'
        end
        
    end
    
    def destroy
        @note.destroy
        redirect_to notes_path
    end
    
    private
    # our find action finds the specific note based on id from browser
    def find_note
        @note = Note.find(params[:id])
    end
    
    # requirements and what your allowed to change in notes
    def note_params
        params.require(:note).permit(:title, :content)
    end
end
