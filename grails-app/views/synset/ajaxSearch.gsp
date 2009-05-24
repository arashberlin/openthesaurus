
    <g:if test="${synsetList.size() == 0}">
         No matches for "${params.q.toString()?.encodeAsHTML()}"
    </g:if>
    <g:else>
	    <table>
	        <th></th>
	        <th>Preferred Term</th>
	        <th>Other Terms</th>
	        <th>Thesaurus</th>
	        <th>Source</th>
	        <th>Pref. Category</th>
	        <g:each in="${synsetList}" status="i" var="synset">
	             <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	                 <td><g:radio name="targetSynset.id" value="${synset.id}"
	                    checked="${i == 0 ? true : false }"/></td>
	                 <td><g:link target="_blank" action="edit" 
	                    id="${synset.id}">${synset.preferredTerm().toString()?.encodeAsHTML()}</g:link></td>
	                 <td>
	                     <g:link target="_blank" action="edit" id="${synset.id}">
	                         <g:each in="${synset?.otherTerms()?.sort()}" var="term">
	                             ${term.toString()?.encodeAsHTML()}<br/>
	                         </g:each>
	                     </g:link>
	                 </td>
	                 <td>${synset.section?.toString()?.encodeAsHTML()}</td>
	                 <td>${synset.source?.toString()?.encodeAsHTML()}</td>
	                 <td>${synset.preferredCategory?.toString()?.encodeAsHTML()}
	                    <g:if test="${synset.preferredCategory?.categoryType}">
	                        <br /><span class="metaInfo">[${synset.preferredCategory?.categoryType}]</span>
	                    </g:if>
	                 </td>
	             </tr>
	        </g:each>
	    </table>
    </g:else>