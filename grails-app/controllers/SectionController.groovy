/**
 * vithesaurus - web-based thesaurus management tool
 * Copyright (C) 2009 vionto GmbH, www.vionto.com
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */ 

import com.vionto.vithesaurus.Section            

class SectionController extends BaseController {

    def beforeInterceptor = [action: this.&adminAuth]
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        if(!params.sort) params.sort = 'priority'
        if(!params.order) params.order = 'desc'
        [ sectionList: Section.list( params ) ]
    }

    def show = {
        [ section : Section.get( params.id ) ]
    }

    def delete = {
        def section = Section.get( params.id )
        if(section) {
            section.delete()
            flash.message = "Section ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Section not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def section = Section.get( params.id )

        if(!section) {
            flash.message = "Section not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ section : section ]
        }
    }

    def update = {
        def section = Section.get( params.id )
        if(section) {
            section.properties = params
            if(!section.hasErrors() && section.save()) {
                flash.message = "Section ${params.id} updated"
                redirect(action:show,id:section.id)
            }
            else {
                render(view:'edit',model:[section:section])
            }
        }
        else {
            flash.message = "Section not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def section = new Section()
        section.properties = params
        return ['section':section]
    }

    def save = {
        def section = new Section(params)
        if(!section.hasErrors() && section.save()) {
            flash.message = "Section ${section.id} created"
            redirect(action:show,id:section.id)
        }
        else {
            render(view:'create',model:[section:section])
        }
    }
}